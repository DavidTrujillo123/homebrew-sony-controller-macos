cask "sony-controller-macos" do
  version "0.1.0"
  sha256 "62b22c55d4239ffda26e2c0f3dc4be7e292c060e0240af9b7c16a80a7a227cb2"

  url "https://github.com/DavidTrujillo123/sony-controller-macos/releases/download/v0.1.0/SonyHeadphonesMac-0.1.0.zip"
  name "Sony Controller macOS"
  desc "Control ANC/EQ/battery/volume for your Sony WH-1000XM5 from the menu bar"
  homepage "https://github.com/DavidTrujillo123/sony-controller-macos"

  depends_on macos: :ventura

  app "SonyHeadphonesMac.app"

  postflight do
    system_command "/usr/bin/xattr",
                    args: ["-dr", "com.apple.quarantine", "#{appdir}/SonyHeadphonesMac.app"],
                    sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.local.sonyheadphonesmac.plist",
  ]
end
