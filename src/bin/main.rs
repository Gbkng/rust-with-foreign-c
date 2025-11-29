use c_and_rust::{CoolStruct, foo};

fn main() {
    let mut cool = CoolStruct { x: 1, y: 2 };
    dbg!(foo(1, 'a' as i8, &mut cool));
}
