## Question 1

To run the program...

1) enter GHCI in the source directory
2) load the file using `:load comp3007_f18_101037159_a2_1.hs`
3) load sample bitmap into list `loadBitmapIntoIt "sample_qr_code_for_decoding.bmp"`
3) display the QR code using `showAsASCIIArt (cleanQRList(convertToList it))`


## Question 2

To run and test program...

1) nter GHCI in the source directory
2) load the file using `:load comp3007_f18_101037159_a2_2.hs`
3) Test the functions...
    - these are some example function calls. To test yourself copy the first part of the function call (part before the `->`) into GHCI
        - // ternaryNOT
        - ternaryNOT Unknown -> Unknown
        - ternaryNOT Falz -> Troo
        - ternaryNOT Troo -> Falz
        - // ternaryAND Falz
        - ternaryAND Falz Falz -> Falz
        - ternaryAND Troo Falz -> Falz
        - ternaryAND Unknown Unknown -> Unknown
        - // ternaryOR
        - ternaryOR Falz Troo -> Troo
        - ternaryOR Falz Falz -> Falz
        - ternaryOR Unknown Unknown -> Unknown
