mod ffi;

pub use ffi::CoolStruct;

pub fn foo(i: i32, c: i8, cool: &mut CoolStruct) -> cty::c_int {
    unsafe {
        ffi::cool_function(i, c, cool)
    }
}
