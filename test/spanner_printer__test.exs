defmodule SpannerPrinterTest do
  use ExUnit.Case

  describe "pieces_to_string" do 
    
    test "returns 0 minutes when pieces are empty" do
      assert SpannerPrinter.pieces_to_string([week: 0, day: 0, hour: 0, minute: 0]) == "0 minutes"
    end

    test "works when every pieces is set as 1" do
      assert SpannerPrinter.pieces_to_string([week: 1, day: 1, hour: 1, minute: 1]) == "1 week 1 day 1 hour 1 minute"
    end

    test "works when some pieces is greater than 1" do
      assert SpannerPrinter.pieces_to_string([week: 1, day: 3, hour: 5, minute: 1]) == "1 week 3 days 5 hours 1 minute"
    end

    test "skips properly empty pieces" do
      assert SpannerPrinter.pieces_to_string([week: 0, day: 1, hour: 2, minute: 14]) == "1 day 2 hours 14 minutes"
      assert SpannerPrinter.pieces_to_string([week: 1, day: 0, hour: 0, minute: 0]) == "1 week"
      assert SpannerPrinter.pieces_to_string([week: 1, day: 0, hour: 2, minute: 6]) == "1 week 2 hours 6 minutes"
      assert SpannerPrinter.pieces_to_string([week: 1, day: 4, hour: 0, minute: 18]) == "1 week 4 days 18 minutes"
    end

  end

end
