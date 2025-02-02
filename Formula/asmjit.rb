class Asmjit < Formula
  desc "Low-latency machine code generation"
  homepage "https://github.com/asmjit/asmjit"
  license "zlib"
  head "https://github.com/asmjit/asmjit.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "ninja" => :build

  def install
    args = ["-DBUILD_SHARED_LIBS=ON", "-DCMAKE_INSTALL_RPATH=#{rpath}", "-DCMAKE_POSITION_INDEPENDENT_CODE=ON", "-DASMJIT_TEST=1", "-DCMAKE_CXX_STANDARD=23"]
    args << "-DCMAKE_SHARED_LINKER_FLAGS=-Wl,-undefined,dynamic_lookup -Wl,-dead_strip_dylibs" if OS.mac?

    system "cmake", "-S", ".", "-G", "Ninja" ,"-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build", "--verbose"
    system "ctest", "--test-dir", "build", "--verbose"
    system "cmake", "--install", "build", "--verbose"
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include <asmjit/asmjit.h>
      int main() {
        asmjit::JitRuntime rt;
        return 0;
      }
    EOS
    system ENV.cxx, "test.cpp", "-std=c++23", "-L#{lib}", "-lasmjit", "-o", "test"
    system "./test"
  end
end
