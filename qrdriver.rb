require "thor"
require 'rqrcode'

class QRDriver < Thor
  desc "generate URL", "Generate a QR code that goes to URL."
  def generate(url)
    qrcode = RQRCode::QRCode.new(url)

    png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: 'black',
      file: nil,
      fill: 'white',
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120
    )

    output_filename = 'qrcode.png'
    IO.binwrite(output_filename, png.to_s)
    open(output_filename)
  end
end

QRDriver.start(ARGV)
