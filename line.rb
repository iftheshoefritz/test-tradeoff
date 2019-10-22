class Point
  attr_accessor :x, :y

  def initialize(x=0, y=0)
    @x = x
    @y = y
  end
end

class Line
  attr_accessor :p1, :p2

  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2
  end

  def sum_x
    4 + 2
  end
end

describe Line do
  describe '#sum_x' do
    context 'test the logic' do
      it 'returns p1.x + p2.x' do
        p1 = Point.new(2,3)
        p2 = Point.new(4,5)

        line = Line.new(p1, p2)
        expect(line.sum_x).to eq(line.p1.x + line.p2.x)
      end
    end

    context 'expectations on the collaborators' do
      it 'returns the sum of x values from p1 and p2' do
        p1 = Point.new
        p2 = Point.new
        line = Line.new(p1, p2)
        allow(p1).to receive(:x).and_return(2)
        allow(p2).to receive(:x).and_return(4)
        expect(line.sum_x).to eq(6)
      end
    end

    # STYLE C: TEST EXPLICIT VALUES
    context 'explicit values' do
      it 'handles positive values' do
        line = Line.new(Point.new(2, 3), Point.new(4,5))
        expect(line.sum_x).to eq(6)
      end

      it 'handles one negative value' do
        line = Line.new(Point.new(3, 3), Point.new(-7,5))
        expect(line.sum_x).to eq(-4)
      end

      it 'handles two negative values' do
        line = Line.new(Point.new(-3, 3), Point.new(-7,5))
        expect(line.sum_x).to eq(-10)
      end
    end
  end
end
