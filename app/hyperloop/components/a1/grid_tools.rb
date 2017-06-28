module GridTools

  def Grid params = {} # gutters: false, align: top, responsive: false, text: center
    c = 'Grid'
    c += ' Grid--gutters' if params[:gutters]
    c += ' large-Grid' if params[:reponsive]

    case params[:align]
    when :top
      c += ' Grid--top'
    when :center
      c += ' Grid--center'
    when :bottom
      c += ' Grid--bottom'
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
    c = 'Grid-cell'

    if params[:col]
      c+= " Grid--#{params:col}of12"
    end

    case params[:size]
    when :half
      c += ' Grid--1of2'
    when :third
      c += ' Grid--1of3'
    when :quarter
      c += ' Grid--1of4'
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
      c += ' Grid-cell--top'
    when :center
      c += ' Grid-cell--center'
    when :bottom
      c += ' Grid-cell--bottom'
    end

    DIV(class: "#{c}") { yield }
  end

end
