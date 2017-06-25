module GridTools

  def Grid
    DIV(class: 'grid') { yield }
  end

  def Cell
    DIV(class: 'grid-cell') { yield }
  end

end
