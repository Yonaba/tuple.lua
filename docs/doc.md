tuple.lua module documentation
==============================

### Requiring the module

Place the file [tuple.lua](https://github.com/Yonaba/tuple.lua/blob/master/tuple.lua) in your project and use [require](http://pgl.yoyo.org/luai/i/require) in your code where desired.

```lua
local tuple = require "tuple"
````
### Creating tuples

Use parenthesis call to create a new tuples. All values passed-in as arguments will be elements of the tuple.

```lua
local triple = tuple(1, 2, 3)
local hextuple = tuple(0.5, 'a', false, true, function() end, {})
````

*0-tuples* are also supported.

```lua
local tup0 = tuple()
````

*Note*: *nil* values are not supported, they will lead to unexpected behavior.

### Indexing tuples

Values in tuple can be simply indexed as Lua tables, using numeric integers.

```lua
local triple = tuple(1, 2, 3)
print(triple[1]) --> "1"
print(triple[2]) --> "2"
print(triple[3]) --> "3"
````

### String representation

The tuple class implements a [__tostring](http://pgl.yoyo.org/luai/i/tostring) methamethod which is used to build a string representation of any tuple object. 

```lua
local tup = tuple('a', true, 1)
print(tup) --> "(a, true, 1)"
````

### Slicing in tuples

Calling parenthesis on a tuple object slices indexed values and returns a new tuple.

```lua
local tup = tuple('a', 'b', 'c', 'd', 'e', 'f')
local new_tup = tup(2,4)
print(new_tup) --> "(b, c, d)"
````

The last argument index `j` defaults to the last element in the tuple.

```lua
local new_tup = tup(4)
print(new_tup) --> "(d, e, f)"
````

The first argument index `i` defaults to the first element in the tuple.

```lua
local new_tup = tup()
print(new_tup) --> "(a, b, c, d, e, f)"
````

*Note*: It is also a simple and convenient way to clone a tuple.

### API methods

#### tuple:elements()

Iterator function to traverse a tuple. Returns a `count` and a `value` at each step of iteration, until `nil` value is encountered or the end of the tuple was reached.

```lua
local tup = tuple(1, 2, {}, 'z')
for i, element in tup:elements() do
  print(i, element)
end
````

#### tuple:includes(aTuple)

Returns `true` if the passed-in `aTuple` is included in the tuple, i.e when all elements found in `aTuple` were found in the original tuple. Otherwise, returns `false`.

```lua
local tup = tuple('a', 'b', 'c')
print(tup:includes(tuple('a'))) --> "true"
print(tup:includes(tuple('a', 'b'))) --> "true"
print(tup:includes(tuple('a', 'b', 'c'))) --> "true"
print(tup:includes(tuple('d'))) --> "false"
````

#### tuple:has(v)

Returns `true` when the given value was found in the tuple. Otherwhise, returns `false`.

```lua
local tup = tuple(0, false, '3')
print(tup:has(true)) --> "false"
print(tup:has('3')) --> "true"
````

#### tuple:len()

Returns the size (the count of values) of the tuple.

```lua
local tup = tuple(0, false, '3')
print(tup:len()) --> "3"
````

*Note:* As with arrays, the length operator `#` can also be used.

```lua
local tup = tuple(true, false)
print(#tup) --> "2"
````

#### tuple:toArray()

Converts the tuple contents to a simple array.

```lua
local tup = tuple(0, false, '3')
local array = tup:toArray()
print(array[1]) --> "0"
print(array[2]) --> "false"
print(array[3]) --> "3"
````

*Note:* 0-tuples tuples returns empty arrays.

### Operations on tuples

Three types of operators can be used with tuple objects. They are `+`, `*`, `==`, `<` and `<=`.

#### Addition

Adding tuples returns a new tuple made of all elements from the left-operand tuple (in the same order), appended with all the other elements from the right-operand tuple (also in the same order).

```lua
local tupA = tuple(1, 2, false)
local tupB = tuple(4, 5, true)
print(tupA + tupB) --> "(1, 2, false, 4, 5, true)"
````

Addition is __not commutative!__

```lua
print(tupB + tupA) --> "(4, 5, true, 1, 2, false)"
````

#### Multiplication

Multiplying a tuple by a integer number `n` returns a new tuple made of n-times the elements of the original tuple.

```lua
local tupA = tuple(1, 2)
local new_tup = tupA * 3
print(new_tup) --> "(1, 2, 1, 2, 1, 2)"
````

Multiplication is __commutative!__.

```lua
local tupA = tuple(1, 2)
local new_tup = 3 * tupA
print(new_tup) --> "(1, 2, 1, 2, 1, 2)"
````

#### Comparison

Comparison tests with tuple uses [lexicographical order](http://en.wikipedia.org/wiki/Lexicographical_order).

##### The `==`operator

The `tupA == tuB` statement evaluates as `true` when each element of `tupA` is equal to the corresponding element (i.e. the element at the same position) in `tupB`. 

```lua
local tupA = tuple(1, true)
local tupB = tuple(1, true)
print(tupA == tupB) --> "true"
````

In case the tuples do not have the same length, the comparision is made on the basis of the shortest tuple.

```lua
local tupA = tuple(1, 2, 3)
local tupB = tuple(1, 2)
print(tupA == tupB) --> "true"
````
 
##### The `<`operator

The `tupA < tuB` statement evaluates as `true` when each element of `tupA` is stricly lower than the corresponding element (i.e. the element at the same position) in `tupB`. 

```lua
local tupA = tuple(1,2)
local tupB = tuple(2,3)
print(tupA < tupB) --> "true"
````

In case the tuples do not have the same length, the comparision is made on the basis of the shortest tuple.

```lua
local tupA = tuple(1,2,3)
local tupB = tuple(2,3)
print(tupA < tupB) --> "true"
````

##### The `<=` operator

The `tupA <= tuB` statement evaluates as `true` when each element of `tupA` is lower or equal to the corresponding element (i.e. the element at the same position) in `tupB`. 

```lua
local tupA = tuple(1,2)
local tupB = tuple(1,3)
print(tupA <= tupB) --> "true"
````

In case the tuples do not have the same length, the comparision is made on the basis of the shortest tuple.

```lua
local tupA = tuple(1,2,3)
local tupB = tuple(2,2)
print(tupA <= tupB) --> "true"
````
 
*Notes:*

* `tupA > tupB` can be translated as `tupB < tupA`
* `tupA >= tupB` can be translated as `tupB <= tupA`
* `tupA ~= tupB` can be translated as `not(tupA == tupB)`