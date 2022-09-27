class WhipMpegts < Formula
  desc "MPEG-TS WHIP client"
  homepage "https://github.com/Eyevinn/whip-mpegts"
  url "https://github.com/Eyevinn/whip-mpegts/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "dee7027737b4bbfcf466fb49b56a500967d7fb8c94d36c4caaceabd8542864b5"
  license "Apache-2.0"

  depends_on "cmake" => :build
  depends_on "gst-libav"
  depends_on "gst-plugins-bad"
  depends_on "gst-plugins-base"
  depends_on "gstreamer"
  depends_on "libsoup@2"

  def install
    system "cmake", "-DCMAKE_BUILD_TYPE=Release", "-G", "Unix Makefiles", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    output = shell_output("#{bin}/whip-mpegts", 1).strip
    assert_match "Usage: whip-mpegts", output
  end
end
