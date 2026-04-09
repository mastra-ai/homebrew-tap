class Mastracode < Formula
  desc "Terminal-based AI coding agent built with Mastra"
  homepage "https://code.mastra.ai/"
  url "https://registry.npmjs.org/mastracode/-/mastracode-0.12.0.tgz"
  sha256 "f75cf66033ba16ad9163d181d01eaa20670fb32885943eea375ff200a87620b4"
  license "Apache-2.0"

  livecheck do
    url "https://registry.npmjs.org/mastracode"
    regex(/["']version["']:\s*["']([^"']+)["']/i)
  end

  depends_on "node@22"

  def install
    system "npm", "install", *std_npm_args

    # Remove prebuilt binaries for non-native architectures to satisfy brew audit
    prebuilds = libexec.glob("lib/node_modules/mastracode/**/prebuilds/*")
    prebuilds.each do |dir|
      arch = Hardware::CPU.arch.to_s
      # Map x86_64 to x64 to match npm prebuild naming convention
      arch = "x64" if arch == "x86_64"
      next if dir.basename.to_s.include?(arch)
      rm_r(dir) if dir.directory?
    end

    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mastracode --version 2>&1")
  end
end
