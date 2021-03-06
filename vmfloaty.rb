class Vmfloaty < Formula
  desc "CLI helper tool for Puppet vmpooler to help you stay afloat"
  homepage "https://github.com/briancain/vmfloaty"
  url "https://rubygems.org/gems/vmfloaty-0.7.9.gem"
  sha256 "83979dc8f82764e67c5783fcfad79103f4b3391f44c2a5b9caeeb7d1fd3f3418"

  depends_on :ruby => "2.2"

  resource "colorize" do
    url "https://rubygems.org/gems/colorize-0.8.1.gem"
    sha256 "0ba0c2a58232f9b706dc30621ea6aa6468eeea120eb6f1ccc400105b90c4798c"
  end

  resource "faraday" do
    url "https://rubygems.org/gems/faraday-0.11.0.gem"
    sha256 "5986f49009d638d971997082f1a6cf1ed835144a66d5c11dd495bf1d9b66e1a2"
  end

  resource "commander" do
    url "https://rubygems.org/gems/commander-4.4.3.gem"
    sha256 "aedf4af6fdf8f05489001bcd70af87d83afec6896a3a2dfd9b49ec02bc391d07"
  end

  def install
    (lib/"vmfloaty/vendor").mkpath
    resources.each do |r|
      r.verify_download_integrity(r.fetch)
      system("#{HOMEBREW_PREFIX}/bin/gem", "install", r.cached_download, "--no-document",
             "--install-dir", vendor_dir.to_s)
    end

    system("#{HOMEBREW_PREFIX}/bin/gem", "install", cached_download, "--no-document",
             "--install-dir", vendor_dir.to_s)

    rm_f Dir["#{vendor_dir}/cache/*.gem"]

    (bin/"floaty").write(exec_script)
  end

  def exec_script
    <<-EOS.undent
    #!/bin/bash
    export GEM_HOME="#{HOMEBREW_PREFIX}/lib/vmfloaty/vendor"
    export DISABLE_BUNDLER_SETUP=1
    exec #{HOMEBREW_PREFIX}/bin/ruby "#{vendor_dir}/bin/floaty" "${@}"
    EOS
  end

  def vendor_dir
    "#{lib}/vmfloaty/vendor"
  end

  test do
    assert_match "token", shell_output("#{bin}/floaty --help")
  end
end
