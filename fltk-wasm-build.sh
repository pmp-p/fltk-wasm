#!/bin/bash

mkdir -p fltk.build
pushd fltk.build

# configure
emcmake cmake \
 -DCMAKE_INSTALL_PREFIX=$PREFIX \
 -DFLTK_BUILD_TEST:BOOL=OFF \
 -DFLTK_BUILD_FLUID:BOOL=OFF \
 -DFLTK_USE_X11=ON -DOPTION_USE_GL=OFF \
 -DFLTK_BUILD_FLTK_OPTIONS=OFF \
 .. 

# build ftlk
emmake make && emmake make install


# build a sample
em++ -sASYNCIFY -o hello-wasm.html ../hello-wasm.cxx  -I${PREFIX}/include -L${PREFIX}/lib -lNX11 -lnano-X -lz -lfreetype -lSDL2 -lfltk

popd
