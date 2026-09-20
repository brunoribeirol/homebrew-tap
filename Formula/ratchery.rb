class Ratchetry < Formula
  desc "Security-first, cost-aware workspace for Claude Code and Codex"
  homepage "https://github.com/brunoribeirol/ratchery"
  url "https://github.com/brunoribeirol/ratchery/releases/download/v1.1.0/ratchery-1.1.0.tar.gz"
  sha256 "20c61ea37d626bac663276f59deaf7e9ec60bfafab8720380bd598b2aee624b1"
  license "MIT"

  depends_on "python@3.14"
  uses_from_macos "git"

  def install
    hidden = Dir[".*"].reject { |path| %w[. ..].include?(File.basename(path)) }
    libexec.install Dir["*"], *hidden

    python = Formula["python@3.14"].opt_bin/"python3.14"
    inreplace libexec/"bin/ratchery", "python3", python.to_s
    bin.install_symlink libexec/"bin/ratchery"
  end

  test do
    projects = testpath/"projects"
    system bin/"ratchery", "setup", "--no-vault", "--projects-root", projects, "--yes"
    system bin/"ratchery", "doctor-global"

    assert_path_exists testpath/".config/ratchery/config.json"
    assert_equal version.to_s, shell_output("#{bin}/ratchery --version").strip
  end
end
