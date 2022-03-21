/* 
 * Brian Yaple
 * Multi-Thread Demo Live Project
 * 
 * 
 * Part 1.
 * 
 * I'm going to use Random Number ranges to quickly 
 * create shorthand signatures. Ideally, this would be done 
 * with a SHA256 function - something immutable.
 * 
 * This started from an existing simple CPP tutortial that demonstrates 
 * multithreading using three different callable types. In this case, 
 * each type has its own signature and each subordinate 
 * thread has a unique signature.
*/

#include <iostream>
#include <thread>
using namespace std;

// A dummy function.
void foo(int Z)
{
	// Function Signature is a value between 0 and 100.
	printf("\tFunction Signature: %d\n", rand() % 100);
	for (int i = 0; i < Z; i++) {
		cout << "Thread using function"
			" pointer as callable\n";
			// A Function-Thread Signature is between 1201 and 1300
			printf("\tThread Signature: %d\n", rand() % 100 + 1300);
	}
}

// A callable object
class thread_obj {
public:
	void operator()(int x)
	{	
		// Object Signature is a value between 100 and 300.
		printf("\tObject Signature: %d\n", rand() % 300 + 100);
		for (int i = 0; i < x; i++)
			cout << "Thread using function"
				" object as callable\n";
			printf("\tThread Signature: %d\n", rand() % 100 + 1200);
	}
};

int main()
{
	cout << "Threads 1 and 2 and 3 "
		"operating independently" << endl;

	// This thread is launched by using
	// function pointer as callable
	thread th1(foo, 3);

	// This thread is launched by using
	// function object as callable
	thread th2(thread_obj(), 3);

	// Define a Lambda Expression
	auto f = [](int x) {
		// Lamda signature is between 300 and 500.
		printf("\tLambda Signature: %d\n", rand() % 500 + 300);

		for (int i = 0; i < x; i++)
			cout << "Thread using lambda"
			" expression as callable\n";
			// And a Lambda-Thread signature is between 1000 and 1100.
			printf("\tThread Signature: %d\n", rand() % 100 + 1100);
	};

	// This thread is launched by using
	// lamda expression as callable
	thread th3(f, 3);

	// Wait for the threads to finish
	// Wait for thread t1 to finish
	th1.join();

	// Wait for thread t2 to finish
	th2.join();

	// Wait for thread t3 to finish
	th3.join();

	return 0;
}
