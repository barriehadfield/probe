module GridTools

  def Grid params = {} # gutters: false, align: top, responsive: false, text: center
    c = 'grid'
    c += ' grid--gutters' if params[:gutters]
    c += ' large-grid' if params[:reponsive]

    case params[:align]
    when :top
      c += ' grid--top'
    when :center
      c += ' grid--center'
    when :bottom
      c += ' grid--bottom'
    end

    case params[:text]
    when :left
      c += ' u-textLeft'
    when :center
      c += ' u-textCenter'
    when :right
      c += ' u-textRight'
    end

    DIV(class: "#{c}") { yield }
  end

  def Cell params = {} # size: half, align: top
    c = 'grid-cell'

    case params[:size]
    when :half
      c += ' grid--1of2'
    when :third
      c += ' grid--1of3'
    when :quarter
      c += ' grid--1of4'
    end

    case params[:text]
    when :left
      c += ' u-textLeft'
    when :center
      c += ' u-textCenter'
    when :right
      c += ' u-textRight'
    end

    case params[:align]
    when :top
      c += ' grid-cell--top'
    when :center
      c += ' grid-cell--center'
    when :bottom
      c += ' grid-cell--bottom'
    end

    DIV(class: "#{c}") { yield }
  end

end
