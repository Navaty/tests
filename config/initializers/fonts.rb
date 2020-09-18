    fonts = CombinePDF.new("#{Rails.root}/app/assets/images/font.pdf").fonts(true)
   
    CombinePDF.register_font_from_pdf_object :time_new_roman, fonts[0]