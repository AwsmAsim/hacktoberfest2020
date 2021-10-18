#include <bits/stdc++.h>

using namespace std;
//using std::cin;
//using std::cout;
//using std::endl;

int main(){
	string in1 = "({}))";
	vector<int> stack;
	for(int i = 0; i < (int)in1.size(); i++){
		if(in1[i] == '(' || in1[i] == '{' || in1[i] == '['){
			stack.push_back(in1[i]);
		}else if(in1[i] == ')' || in1[i] == '}' || in1[i] == ']'){
			stack.pop_back();
		}
	}
	if(stack.size() == 0){
		cout << "\nBalanced String" << endl;
	}else{
		cout << "\nLenght of stack: " << (int)stack.size() << endl;
		cout << "\nUnBalanced String" << endl;
	}
	
	
	return 0;
}
