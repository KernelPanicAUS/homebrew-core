class Awslogs < Formula
  include Language::Python::Virtualenv

  desc "Simple command-line tool to read AWS CloudWatch logs"
  homepage "https://github.com/jorgebastida/awslogs"
  url "https://files.pythonhosted.org/packages/96/7b/20bff9839d6679e25d989f94ca4320466ec94f3441972aadaafbad50560f/awslogs-0.14.0.tar.gz"
  sha256 "1b249f87fa2adfae39b9867f3066ac00b9baf401f4783583ab28fcdea338f77e"
  license "BSD-3-Clause"
  revision 1
  head "https://github.com/jorgebastida/awslogs.git"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "38caa20a341705f9ef458157f2efcd340ebac1ed4a28a9f087fd362aeb10651b"
    sha256 cellar: :any_skip_relocation, big_sur:       "7a0703d7739d19a445b81c7d67384cfbcc20e10a9c1dc5f11427b2cecddf18f2"
    sha256 cellar: :any_skip_relocation, catalina:      "54ac7491a722ea8c9139cb08ab8c8a157bbe90e5f634cd56c6f1def1e16f1635"
    sha256 cellar: :any_skip_relocation, mojave:        "0401664d4b96671c53d6491719942b92801805f90836f08d5fa8d0cfddf6be29"
    sha256 cellar: :any_skip_relocation, high_sierra:   "4a58816b1c333a4592d50abb75e8dbb3779904e56389dec857d42c6166a6f1ab"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "4a8c91210a3e477fea50d9794dee0f7221f18e38797f7bddac25f6bb239b924c"
  end

  depends_on "python@3.9"

  uses_from_macos "zlib"

  on_linux do
    depends_on "openssl@1.1"
  end

  resource "boto3" do
    url "https://files.pythonhosted.org/packages/bc/9c/960e500e3108dc43966cbf56861575786d068089c17c581f6efbfa228aab/boto3-1.14.20.tar.gz"
    sha256 "e6ab26155b2f83798218106580ab2b3cd47691e25aba912e0351502eda8d86e0"
  end

  resource "botocore" do
    url "https://files.pythonhosted.org/packages/98/89/388651fcd98d8b9be63c44e356e28c24f742259cea507c13f501e623a4fc/botocore-1.17.20.tar.gz"
    sha256 "d1bf8c2085719221683edf54913c6155c68705f26ab4a72c45e4de5176a8cf7b"
  end

  resource "docutils" do
    url "https://files.pythonhosted.org/packages/93/22/953e071b589b0b1fee420ab06a0d15e5aa0c7470eb9966d60393ce58ad61/docutils-0.15.2.tar.gz"
    sha256 "a2aeea129088da402665e92e0b25b04b073c04b2dce4ab65caaa38b7ce2e1a99"
  end

  resource "jmespath" do
    url "https://files.pythonhosted.org/packages/3c/56/3f325b1eef9791759784aa5046a8f6a1aff8f7c898a2e34506771d3b99d8/jmespath-0.10.0.tar.gz"
    sha256 "b85d0567b8666149a93172712e68920734333c0ce7e89b78b3e987f71e5ed4f9"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/be/ed/5bbc91f03fa4c839c4c7360375da77f9659af5f7086b7a7bdda65771c8e0/python-dateutil-2.8.1.tar.gz"
    sha256 "73ebfe9dbf22e832286dafa60473e4cd239f8592f699aa5adaf10050e6e1823c"
  end

  resource "s3transfer" do
    url "https://files.pythonhosted.org/packages/50/de/2b688c062107942486c81a739383b1432a72717d9a85a6a1a692f003c70c/s3transfer-0.3.3.tar.gz"
    sha256 "921a37e2aefc64145e7b73d50c71bb4f26f46e4c9f414dc648c6245ff92cf7db"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/6b/34/415834bfdafca3c5f451532e8a8d9ba89a21c9743a0c59fbd0205c7f9426/six-1.15.0.tar.gz"
    sha256 "30639c035cdb23534cd4aa2dd52c3bf48f06e5f4a941509c8bafd8ce11080259"
  end

  resource "termcolor" do
    url "https://files.pythonhosted.org/packages/8a/48/a76be51647d0eb9f10e2a4511bf3ffb8cc1e6b14e9e4fab46173aa79f981/termcolor-1.1.0.tar.gz"
    sha256 "1d6d69ce66211143803fbc56652b41d73b4a400a2891d7bf7a1cdf4c02de613b"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/05/8c/40cd6949373e23081b3ea20d5594ae523e681b6f472e600fbc95ed046a36/urllib3-1.25.9.tar.gz"
    sha256 "3018294ebefce6572a474f0604c2021e33b3fd8006ecd11d62107a5d2a963527"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/awslogs --version 2>&1")
  end
end
