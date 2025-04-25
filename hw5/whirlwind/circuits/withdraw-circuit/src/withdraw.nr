use std::hash::pedersen_hash;
use std::merkle::compute_merkle_root;

fn main(
    r: Field,
    index: Field,
    path: [Field;8],

    root: Field,
    id: Field
){
    let computed_commitment = pedersen_hash([id, r]);
    assert(root == compute_merkle_root(computed_commitment, index, path))
}