
use std::hash::pedersen_hash;
use std::merkle::compute_merkle_root;

fn main(
    id: Field,
    r: Field,
    oldPath: [Field;8], //not sure the depth should always be 8

    oldRoot: Field,
    newRoot: Field,
    commitment: Field,
    index: Field

){
    let computed_commitment = pedersen_hash([id, r]);
    assert(computed_commitment == commitment);

    let empty_leaf = 0x18d85f3de6dcd78b6ffbf5d8374433a5528d8e3bf2100df0b7bb43a4c59ebd63;
    let computed_old_root = compute_merkle_root(empty_leaf, index, oldPath);
    assert(computed_old_root == oldRoot);

    let computed_new_root = compute_merkle_root(commitment, index,oldPath);
    assert(computed_new_root == newRoot);
}