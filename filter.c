/*
 * Inital Template Code from ECE 466
 * To be adpted...
 */

#define SC_INCLUDE_FX

#include "systemc.h"

// class template "fir"
//
// Template Parameters:
//   class T - specifies the data-type used within the FIR
//     T must be a numeric type that supports:
//      operator==(const T&)
//      operator=(int)
//      operator+=(const T&)
//      operator*(const T&)
//   unsigned N - specifies the number of taps in FIR
//     N must be greater than zero
//
// Constructor parameters:
//   sc_module_name name - specifies instance name
//   const T* coeffs - pointer to coefficient array
//     coeffs array must contain N coefficients

template <class T, unsigned N> class fir: public sc_module {
public:
    sc_in<T> in;
    sc_out<T> out;
    sc_in_clk clock;

    SC_HAS_PROCESS(fir);

    fir(sc_module_name name, const T* coeffs) :
        sc_module(name), _coeffs(coeffs) 
    {
        assert(N > 0);
        SC_CTHREAD(main, clock.pos());
    }

private:
    const T* _coeffs;

    void main() {
	T _delay_line[N];
        T sum;
        unsigned i;

        for (i=0; i < N; i++) _delay_line[i] = 0;

        while(1) {
            // shift samples within delay line
            for (i=N-1; i > 0; i--) _delay_line[i] = _delay_line[i-1];

            // read new data sample
            _delay_line[0] = in.read();

            // compute fir output
            sum = 0;
            for (i=0; i < N; i++) sum += _delay_line[i] * _coeffs[i];

            out.write(sum);
	    wait();
	}
    } 
};

// simple stimulus generator

template <class T> class stimulus : public sc_module {
public:
    sc_out<T> out;

    SC_HAS_PROCESS(stimulus);

    stimulus(sc_module_name name) : sc_module(name) {
        SC_THREAD(main);
    }

    void main() {
        out.write(0);
        wait(10, SC_NS);
        out.write(2);
        wait(1, SC_NS);
        out.write(0);
    }
};

// simple response logger

template <class T> class response : public sc_module {
public:
    sc_in<T> in;

    SC_HAS_PROCESS(response);

    response(sc_module_name name) : sc_module(name) {
        SC_METHOD(main);
        sensitive << in;
    }

    void main() {
        cout << "at time: " << sc_time_stamp() << " output: " 
             << in.read() << endl;
    }
};

int sc_main (int argc , char *argv[]) 
{
    // to use a fixed-point type, uncomment next line
    // and comment out the line after it:
    // typedef sc_fixed<8,5> fir_T;
    typedef double fir_T;
 
    const fir_T coeffs[] = {1.1111, 2.2222, 3.3333, 4.4444};
    const unsigned taps = sizeof(coeffs) / sizeof(coeffs[0]);

    sc_clock clock("c1", 1, SC_NS);
    sc_signal<fir_T> fir_in;
    sc_signal<fir_T> fir_out;

    fir<fir_T, taps> fir1("fir1", &coeffs[0]);
    fir1.clock(clock);
    fir1.in(fir_in);
    fir1.out(fir_out);

    stimulus<fir_T> stim1("stim1");
    stim1.out(fir_in);

    response<fir_T> resp1("resp1");
    resp1.in(fir_out);

    sc_start(100, SC_NS);
    return 0;
}