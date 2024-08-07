// C
#include <cassert>
#include <cctype>
#include <cerrno>
#include <cfloat>
#include <ciso646>
#include <climits>
#include <clocale>
#include <cmath>
#include <csetjmp>
#include <csignal>
#include <cstdarg>
#include <cstddef>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>

#if __cplusplus >= 201103L
#include <ccomplex>
#include <cfenv>
#include <cinttypes>
#include <cstdalign>
#include <cstdbool>
#include <cstdint>
#include <ctgmath>
#include <cwchar>
#include <cwctype>
#endif

// C++
#include <algorithm>
#include <bitset>
#include <complex>
#include <deque>
#include <exception>
#include <fstream>
#include <functional>
#include <iomanip>
#include <ios>
#include <iosfwd>
#include <iostream>
#include <istream>
#include <iterator>
#include <limits>
#include <list>
#include <locale>
#include <map>
#include <memory>
#include <new>
#include <numeric>
#include <ostream>
#include <queue>
#include <set>
#include <sstream>
#include <stack>
#include <stdexcept>
#include <streambuf>
#include <string>
#include <typeinfo>
#include <utility>
#include <valarray>
#include <vector>

#if __cplusplus >= 201103L
#include <array>
#include <atomic>
#include <chrono>
#include <condition_variable>
#include <forward_list>
#include <future>
#include <initializer_list>
#include <mutex>
#include <random>
#include <ratio>
#include <regex>
#include <scoped_allocator>
#include <system_error>
#include <thread>
#include <tuple>
#include <typeindex>
#include <type_traits>
#include <unordered_map>
#include <unordered_set>
#endif

// 基本
using uchar = unsigned char;

using int8 = signed char;
using uint8 = unsigned char;
using byte = unsigned char;

using int16 = short;
using uint16 = unsigned short;

using int32 = int;
using uint32 = unsigned int;


using s8 = signed char;
using u8 = unsigned char;
using s16 = short;
using u16 = unsigned short;
using s32 = int;
using u32 = unsigned int;

using wchar = wchar_t;

// static_cast
#define x_static_cast(t, v) static_cast<t>(v)

// dynamic_cast
#define x_dynamic_cast(t, v) dynamic_cast<t>(v)

// const_cast
#define x_const_cast(t, v) const_cast<t>(v)

// reinterpret_cast
#define x_reinterpret_cast(t, v) reinterpret_cast<t>(v)

// size_t 转 int
#define x_to_int(v) static_cast<int>(v)

// 任何类型 转 float
#define x_to_float(v) static_cast<float>(v)

// 任何类型 转 double
#define x_to_double(v) static_cast<double>(v)

// 任何类型 转 bool
#define x_to_bool(v) static_cast<bool>(v)

// 任何类型 转 char
#define x_to_char(v) static_cast<char>(v)

// 任何类型 转 unsigned char
#define x_to_u8(v) static_cast<u8>(v)

#define uchar_max UCHAR_MAX
#define uchar_min 0x0

#define int8_max SCHAR_MAX
#define int8_min SCHAR_MIN
#define uint8_max UCHAR_MAX
#define uint8_min 0x00

#define int16_min SHRT_MIN
#define int16_max SHRT_MAX
#define uint16_min 0x0000
#define uint16_max USHRT_MAX

#define int32_min INT_MIN
#define int32_max INT_MAX
#define uint32_min 0x00000000
#define uint32_max UINT_MAX

using int64 = long long;
using uint64 = unsigned long long;

using s64 = long long;
using u64 = unsigned long long;

#define int64_min LLONG_MIN
#define int64_max LLONG_MAX
#define uint64_min 0x0000000000000000
#define uint64_max ULLONG_MAX
#define s64_min LLONG_MIN
#define s64_max LLONG_MAX
#define u64_min 0x0000000000000000
#define u64_max ULLONG_MAX
