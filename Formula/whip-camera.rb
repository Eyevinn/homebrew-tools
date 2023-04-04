class WhipCamera < Formula
  desc "Camera WHIP client"
  homepage "https://github.com/Eyevinn/whip-camera"
  url "https://github.com/Eyevinn/whip-camera/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3ff2de84126ee3ada3f03700e60e5285df291dc86a367d1848b046a76157077f "
  license "Apache-2.0"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "glib" => :build
  depends_on "gst-libav"
  depends_on "gst-plugins-bad"
  depends_on "gst-plugins-good"
  depends_on "gst-plugins-base"
  depends_on "gstreamer"
  depends_on "libsoup@2"

  def install
    system "cmake", "-DCMAKE_BUILD_TYPE=Release", "-G", "Unix Makefiles", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    output = shell_output("#{bin}/whip-camera", 1).strip
    assert_match "Usage: GST_PLUGIN_PATH=", output
  end
end
