class Mastracode < Formula
  desc "Terminal-based AI coding agent built with Mastra"
  homepage "https://code.mastra.ai/"
  url "https://registry.npmjs.org/mastracode/-/mastracode-0.30.0.tgz"
  sha256 "2f93c893a4861ca8d884f0c73a6140999f6f1a672614b6994cc1687314fa8d8d"
  license "BUSL-1.1"

  livecheck do
    url "https://registry.npmjs.org/mastracode"
    regex(/["']version["']:\s*["']([^"']+)["']/i)
  end

  depends_on "node@22"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    output = shell_output("#{bin}/mastracode --version 2>&1", 0)
    assert_match(/\d+\.\d+\.\d+/, output)
  end
end
