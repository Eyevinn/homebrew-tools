class WhppPlay < Formula
  desc "WHPP player based on GStreamer"
  homepage "https://github.com/Eyevinn/whpp-play"
  url "https://github.com/Eyevinn/whpp-play/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "6d321a1c8e8ef10fd650bee5c36d2d863545d4841bdd43f4576f120749954d2a"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/Eyevinn/homebrew-tools/releases/download/whpp-play-0.1.0"
    rebuild 1
    sha256 cellar: :any,                 big_sur:      "71ca3eea7199ed678850c74bc124d37647af35cd72bae144b5d5de11b3e1d60c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b7bb159f40a093decf8469f455c5b4c2e293d0e688167ebc86cef36e2eed2cf7"
  end

  depends_on "cmake" => :build
  depends_on "gstreamer"

  def install
    system "cmake", "-DCMAKE_BUILD_TYPE=Release", "-G", "Unix Makefiles", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    output = shell_output(`bin/"whpp-play"`, 1).strip
    assert_match "Usage: ", output
  end
end
