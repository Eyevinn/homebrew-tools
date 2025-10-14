class WhipCamera < Formula
  desc "Camera WHIP client"
  homepage "https://github.com/Eyevinn/whip-camera"
  url "https://github.com/Eyevinn/whip-camera/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3ff2de84126ee3ada3f03700e60e5285df291dc86a367d1848b046a76157077f"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/Eyevinn/homebrew-tools/releases/download/whip-camera-0.1.0"
    sha256 cellar: :any,                 monterey:     "a8d49c73cc8cfe59feaf1a53afc3d1471f19d18c938cc463c8a657f522be5ed9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "688821b61ebf8956f2f92849cb9c3cc26ea1be04988560cc298de62893c463b4"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "gstreamer"

  def install
    system "cmake", "-DCMAKE_BUILD_TYPE=Release", "-G", "Unix Makefiles", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    output = shell_output("#{bin}/whip-camera", 1).strip
    assert_match "Usage: GST_PLUGIN_PATH=", output
  end
end
