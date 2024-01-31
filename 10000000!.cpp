/*
g++ '10000000!.cpp' -I/local/include -L/local/lib -o '10000000!.exe' -lgmp -lgmpxx -std=c++11
Put libgmp-10.dll and libgmpxx-4.dll in the folder where 10000000!.exe is located
*/

#include <iostream>
#include <chrono>
#include <gmpxx.h>

using namespace std;
using namespace std::chrono;

const int N = 10000000;

int main(){

    mpz_class fact = 1;

    steady_clock::time_point start = steady_clock::now();
    for (int i=2; i<=N; ++i)
       fact *= i;
    steady_clock::time_point end = steady_clock::now();
    cout << "Calculated in: " << endl;
    cout << duration_cast<seconds>(end - start).count() << "s\n";

    cout << N << "! = " << fact.get_str(10) << "\n";
    return 0;
}
