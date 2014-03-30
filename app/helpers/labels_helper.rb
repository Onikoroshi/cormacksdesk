module LabelsHelper
  def label_colors
    [
      "default",
      "blue",
      "white",
      "yellow",
      "red",
      "orange",
      "green",
      "black",
      "purple",
      "brown",
      "grey",
      "pink"
    ]
  end

  def color_style_text color
    case color
    when "default"
      bg_color = 'lightgray'
      text_color = 'black'
    when "blue"
      bg_color = 'deepskyblue'
      text_color = 'white'
    when "white"
      bg_color = 'white'
      text_color = 'black'
    when "yellow"
      bg_color = 'lightgoldenrodyellow'
      text_color = 'black'
    when "red"
      bg_color = 'red'
      text_color = 'white'
    when "orange"
      bg_color = 'orange'
      text_color = 'white'
    when "green"
      bg_color = 'green'
      text_color = 'white'
    when "black"
      bg_color = 'black'
      text_color = 'white'
    when "purple"
      bg_color = 'purple'
      text_color = 'white'
    when "brown"
      bg_color = 'brown'
      text_color = 'white'
    when "grey"
      bg_color = 'gray'
      text_color = 'white'
    when "pink"
      bg_color = 'pink'
      text_color = 'darkpink'
    else
      bg_color = 'white'
      text_color = color
    end

    "background-color:" + bg_color.to_s + ";color:" + text_color.to_s + ";"
  end
end
