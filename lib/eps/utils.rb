module Eps
  module Utils
    def self.column_type(c, k)
      if !c
        raise ArgumentError, "Missing column: #{k}"
      elsif c.all? { |v| v.nil? }
        # goes here for empty as well
        nil
      elsif c.any? { |v| v.nil? }
        raise ArgumentError, "Missing values in column #{k}"
      elsif c.all? { |v| v.is_a?(Numeric) }
        "numeric"
      elsif c.all? { |v| v.is_a?(String) || v == true || v == false }
        "categorical"
      else
        raise ArgumentError, "Column values must be all numeric or all string: #{k}"
      end
    end

    def self.read_onnx(byte_str)
      Onnx::ModelProto.decode(byte_str).to_h
    end
  end
end
