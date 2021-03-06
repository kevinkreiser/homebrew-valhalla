class PrimeServer < Formula
  desc "Non-blocking web server API based on ZeroMQ"
  homepage "https://github.com/kevinkreiser/prime_server"
  url "https://github.com/kevinkreiser/prime_server.git",
      :tag => "0.6.4",
      :revision => "14c7592d604264110eb70e984dc6ccd4d9b04a69"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "curl" if MacOS.version <= :lion
  depends_on "czmq"
  depends_on "zeromq"

  def install
    system "./autogen.sh"
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    assert_match "Usage: #{bin}/prime_serverd", shell_output("#{bin}/prime_serverd", 1)
  end
end
