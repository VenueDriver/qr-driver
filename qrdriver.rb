require "thor"
require 'rqrcode'

class QRDriver < Thor

  desc "generate URL", "Generate a QR code that goes to URL."
  option :output_folder, desc: 'Folder for default output filename.'
  option :output_filename, desc: 'Override full output filename.'
  option :format, default: 'svg', desc: 'Output format: SVG or PNG'
  option :open, type: :boolean, default: true, desc: 'Open the output file.'
  def generate(url)
    qrcode = RQRCode::QRCode.new(url)

    case options[:format]
    when /png/i
      qrdata = qrcode.as_png(
        bit_depth: 1,
        border_modules: 4,
        color_mode: ChunkyPNG::COLOR_GRAYSCALE,
        color: 'black',
        file: nil,
        fill: 'white',
        module_px_size: 6,
        resize_exactly_to: false,
        resize_gte_to: false,
        size: 4200
      )
    when /svg/i
      qrdata = qrcode.as_svg(
        offset: 0,
        color: '000',
        shape_rendering: 'crispEdges',
        module_size: 6,
        standalone: true
      )
    end

    output_filename =
      options[:output_filename] ||
        "#{options[:output_folder]}qrcode-" +
        "#{url.gsub(/\W/,'-')}.#{options[:format].to_s}"

    IO.binwrite(output_filename, qrdata.to_s)

    `open #{output_filename}` if options[:open]

  end
end

QRDriver.start(ARGV)
