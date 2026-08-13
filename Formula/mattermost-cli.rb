class MattermostCli < Formula
  desc "Mattermost CLI for agents and humans"
  homepage "https://github.com/ardasevinc/mattermost-cli"
  version "2.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ardasevinc/mattermost-cli/releases/download/v#{version}/mattermost-cli_#{version}_darwin_arm64.tar.gz"
      sha256 "a1e21d40cb8bc9e718f05ea2541cde5f83ca4cfd4aba3d406e16e84dd3aa8110"
    else
      url "https://github.com/ardasevinc/mattermost-cli/releases/download/v#{version}/mattermost-cli_#{version}_darwin_amd64.tar.gz"
      sha256 "edf9d707d8dc3bdea1fd526f31a714d386d7d6cb4f18c6fd581e6a61cf1d9c65"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ardasevinc/mattermost-cli/releases/download/v#{version}/mattermost-cli_#{version}_linux_arm64.tar.gz"
      sha256 "d61e08a0ae74c089a4238ab38416d011b71aebc4233f31fa3de340354fba529b"
    else
      url "https://github.com/ardasevinc/mattermost-cli/releases/download/v#{version}/mattermost-cli_#{version}_linux_amd64.tar.gz"
      sha256 "70cf07e2d6acf60af85b12729df4782a133f61a72f2471e992e382b114164061"
    end
  end

  def install
    bin.install "mm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mm --version")
    assert_match "Mattermost CLI", shell_output("#{bin}/mm --help")
  end
end
