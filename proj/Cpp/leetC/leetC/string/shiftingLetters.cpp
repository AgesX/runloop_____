//
//  shiftingLetters.cpp
//  leetC
//
//  Created by Jz D on 2021/9/9.
//

#include "shiftingLetters.hpp"




#include <iostream>

#include <vector>



using namespace std;








class Solution {
public:
    string shiftingLetters(string s, vector<int>& shifts) {
        int count = (int)shifts.size();
        int i = count - 1;
        int last = 0;
        while (i >= 0) {
            last = (shifts[i] + last) % 26;
            shifts[i] = last;
            i--;
        }
        i = 0;
        string result = s;
        while (i < count) {
            result[i] = (s[i] - 'a' + shifts[i]) % 26 + 'a';
            i += 1;
        }
        return result;
    }
};



//  Shifting Letters
