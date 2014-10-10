// Copyright (c) 2011, David J. Pearce (djp@ecs.vuw.ac.nz)
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//    * Redistributions of source code must retain the above copyright
//      notice, this list of conditions and the following disclaimer.
//    * Redistributions in binary form must reproduce the above copyright
//      notice, this list of conditions and the following disclaimer in the
//      documentation and/or other materials provided with the distribution.
//    * Neither the name of the <organization> nor the
//      names of its contributors may be used to endorse or promote products
//      derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL DAVID J. PEARCE BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

package whiley.lang

import * from whiley.lang.Errors

import u8 from whiley.lang.Int
import i8 from whiley.lang.Int

// find first index in string which matches character.  If no match,
// then return null. 
public function indexOf(string str, char c) => int|null:
    int i = 0
    while i < |str|:
        if str[i] == c:
            return i
        i = i + 1
    return null

public function indexOf(string str, char c, int start) => int|null:
    //
    int i = start
    while i < |str|:
        if str[i] == c:
            return i
        i = i + 1
    return null

// find last index in string which matches character.  If no match,
// then return null. 
public function lastIndexOf(string str, char c) => int|null:
    //
    int i = |str|
    while i > 0:
        i = i - 1
        if str[i] == c:
            return i
    return null

// replace all occurrences of "old" with "new" in string "str".  
public function replace(string str, char old, char n) => string:
    //
    int i = 0
    while i < |str|:
        if str[i] == old:
            str[i] = n
        i = i + 1
    return str    

// Convert a byte stream into a string using the standard ASCII
// encoding.
public function fromASCII([byte] data) => string:
    string r = ""
    for b in data:
        r = r ++ Byte.toChar(b)
    return r    

// FIXME: this method is completely broken!
public function toUTF8(string s) => [byte]:
    [byte] r = []
    for c in s:
        // the following line is fatally flawed!
        r = r ++ [Int.toUnsignedByte((int) c)]
    return r

