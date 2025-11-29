#[repr(C)]
pub struct CoolStruct {
    pub x: cty::c_int,
    pub y: cty::c_int,
}

#[link(name = "foreign_c")]
unsafe extern "C" {
    pub fn cool_function(i: cty::c_int, c: cty::c_char, cs: *mut CoolStruct) -> cty::c_int;
}