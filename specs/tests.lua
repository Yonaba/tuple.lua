require 'luacov'
local tuple = require 'tuple'
  
context('Creating tuples', function()

  test('Instantiates new tuples with () call', function()
    local a = tuple(1,2)
    assert_equal(#a, 2)
    assert_equal(a[1],1)
    assert_equal(a[2],2)
  end)
  
  test('Empty parens returns 0-tuples', function()
    local a = tuple()
    assert_equal(#a, 0)
  end)

end)
  
context('Slicing tuples : t(i,j)', function()

  test('One can slice values in a tuple', function()
    local a = tuple('a', 'b', 'c', 'd', 'e')
    local sub_a = a(2,4)
    assert_equal(sub_a, tuple('b','c','d'))
  end) 

  test('Argument j defaults to the last element in tuple', function()
    local a = tuple(1,2,3,4,5)
    local sub_a = a(3)
    assert_equal(sub_a, tuple(3,4,5))
  end)

  test('Argument i defaults to the first element in tuple', function()
    local a = tuple(1,2,3,4,5)
    local sub_a = a()
    assert_equal(sub_a, a)
  end)

end)
  
context('String representation:', function()
  
  test('class provides a tostring metamethod', function()
    assert_equal(tostring(tuple(1,2,3)),'(1, 2, 3)')
  end)
  
  test('the string representation supports booleans', function()
    assert_equal(tostring(tuple(true,false)),'(true, false)')
  end)    
  
end)
 
context('Inspecting tuples', function()
  
  test('Tuple class provides an iterator', function()
    local tup = tuple('l', 'u', 'a')
    for i, element in tup:elements() do
      assert_equal(element, ('lua'):sub(i,i))
    end
  end)  
  
  test('has() returns true if a value belongs to a tuple', function()
    local tup = tuple(1,2,3,4,5,6,7,8,9,10)
    for i = 1,10 do
      assert_true(tup:has(i))
    end
    tup = tuple()
    for i = 1,10 do
      assert_false(tup:has(i))
    end    
  end)
  
end)

context('Querying size', function()

  test('len() returns the tuple size', function()
    local tup = tuple(0.1, 0.2, 'a', 10, false)
    local tup0 = tuple()
    assert_equal(tup:len(), 5)
    assert_equal(tup0:len(), 0)
  end)

  test('# operator is the same as len()', function()
    local tup = tuple(0.1, 0.2, 'a', 10, false)
    local tup0 = tuple()
    assert_equal(#tup, tup:len())
    assert_equal(#tup0, tup0:len())
  end)
  
end)

context('Inclusion', function()

  test('includes() returns true if tuple contains another', function()
    local tup_big = tuple(1,2,3)
    assert_true(tup_big:includes(tuple(1)))
    assert_true(tup_big:includes(tuple(1,2)))
    assert_true(tup_big:includes(tuple(1,2,3)))
  end)
  
  test('tuples always includes itself', function()
    local tup = tuple(1,2,3,4,5)
    assert_true(tup:includes(tup))
  end)  
  
end)

context('Array conversion', function()

  test('toArray() method converts a tuple to an array', function()
    local tup = tuple('a', 'b', 'c')
    local array = tup:toArray()
    assert_equal(#array, 3)
    assert_equal(array[1], 'a')
    assert_equal(array[2], 'b')
    assert_equal(array[3], 'c')
  end)
  
  test('Empty tuples are converted to empty arrays', function()
    local tup = tuple()
    local array = tup:toArray()
    assert_equal(#array, 0)
  end)
  
end)

context('Comparison is lexicographical', function()

  context('Equality test', function()
  
    test('Testing A == B', function()
      local A = tuple('a', 'b', 'c', 'd', false, true)
      local B = tuple('a', 'b', 'c', 'd', false, true)
      assert_true(A == B)
    end)
    
    test('A tuple is always equal to itself', function()
      local A = tuple('a', false, true)
      assert_true(A == A)
    end)
    
  end)
 
  context('Relational order', function()
 
    test('Relational < test', function()
      assert_true(tuple('a', 'b', 'c') < tuple('b', 'c', 'd'))
      assert_true(tuple(1,2,3,4) < tuple(2,3,4))
      assert_false(tuple(1,2,3,4) < tuple(2,3,3))
    end)
    
    test('Relational <= test', function()
      assert_true(tuple('a', 'b', 'c') <= tuple('b', 'b', 'c'))
      assert_true(tuple(1,1,1) <= tuple(2,2,1,3))
      assert_false(tuple(1,1,1) <= tuple(1,2,0,3))
    end)    
  
  end)
  
end)

context('Operations', function()

  test('Addition', function()
    assert_equal(tuple(1) + tuple(2), tuple(1,2))
    assert_equal(tuple(3,4) + tuple('a', false), tuple(3, 4, 'a', false))
    assert_equal(tuple() + tuple(), tuple())
  end)
  
  test('Multiplication', function()
    assert_equal(tuple('a','z') * 2, tuple('a', 'z', 'a', 'z'))
    assert_equal(tuple(1) * 3, tuple(1,1,1))
    assert_equal(tuple() * 10, tuple())
    assert_nil(tuple() * 0)
  end)  
  
end)