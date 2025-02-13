git clone https://github.com/buddy-compiler/buddy-mlir.git
cd buddy-mlir
git submodule update --init
mkdir llvm/build
cd llvm/build
cmake -G Ninja ../llvm \
    -DLLVM_ENABLE_PROJECTS="mlir" \
    -DLLVM_TARGETS_TO_BUILD="host;RISCV" \
    -DLLVM_ENABLE_ASSERTIONS=ON \
    -DCMAKE_BUILD_TYPE=RELEASE
ninja
cd ../..
mkdir build
cd build
pwd
cmake -G Ninja .. \
    -DMLIR_DIR=$PWD/../llvm/build/lib/cmake/mlir \
    -DLLVM_DIR=$PWD/../llvm/build/lib/cmake/llvm \
    -DOpenCV_DIR=$PWD/../tests/Actions/opencv/build/ \
    -DLLVM_ENABLE_ASSERTIONS=ON \
    -DCMAKE_BUILD_TYPE=RELEASE
ninja check-buddy
