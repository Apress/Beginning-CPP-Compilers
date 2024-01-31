/*
g++ '100!.cpp' -I/local/include -L/local/lib -o '100!.exe' -lgmp -lgmpxx -std=c++11
libgmp-10.dll
libgmpxx-4.dll
./'100!.exe' > '100!.txt'
*/

#include <iostream>
#include <chrono>
#include <gmpxx.h>

using namespace std;
using namespace std::chrono;

const int N = 100;// 10000000

int main(){

    mpz_class fact = 1;

    steady_clock::time_point start = steady_clock::now();
    for (int i=2; i<=N; ++i)
        fact *= i;
    steady_clock::time_point end = steady_clock::now();
    cout << "Calculated in " << duration_cast<seconds>(end - start).count() << "s" << endl;
    cout << "Calculated in " << duration_cast<microseconds>(end - start).count() << "mcs" << endl;
    cout << "Calculated in " << duration_cast<nanoseconds>(end - start).count() << "ns" << endl;

    cout << N << "! = " << fact.get_str(10) << "\n";
    return 0;
}
