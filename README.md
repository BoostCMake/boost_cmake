# Boost Patchset
[![Build Status](https://travis-ci.com/nemo1369/boost_cmake.svg?token=DHGZQ8ocJtbnXsTs61qE&branch=master)](https://travis-ci.com/nemo1369/boost_cmake)

This repository intention is to make the build system separate from the source code, which drops off the requirement of every library refactoring and embedding the CMake into every submodule.

## Usage

First of all, obviously, boost and boost_cmake sources repository are required.

Then configure the CMake project telling where actual sources are located.

```
git clone --recurse-submodules https://github.com/boostorg/boost.git
git clone --recurse-submodules https://github.com/BoostCMake/boost_cmake.git
mkdir build && cd build && cmake -DBUILD_WITH_SOURCES_DIR=../boost ../boost_cmake
```

## Supported Versions

Supported Boost versions are now: 1.58.0, 1.59.0, 1.60.0, 1.61.0

More versions are coming with more interest.
