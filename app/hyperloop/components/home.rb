module Home
  class Page < Hyperloop::Component
    render(DIV) do
      h1 { "Here I really am" }
    end
  end
end
