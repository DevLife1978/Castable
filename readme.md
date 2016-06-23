#Castable

Cast free framework for all castable objects


Currents:
- Array, ArraySlice to Unsafe<Mutable>Pointer
    - let a = [1, 2, 3]
    - let pointer = a.pointer

- UnsafePointer <-> UnsafeMutablePointer
    - let a <- UnsafePointer<Double>
    - let b: UnsafeMutablePointer<Double> = a.cast()

Nexts:
- Umm.. Thinking... please let me know cast free objects that you wants 