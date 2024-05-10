module Dice (randomizeArray, randomIntList1021, randomBoolList1021, randomIntList1024, randomBoolList1024) where

-- I rolled some dice to make this string, but I got tired of doing that pretty
-- quickly, so I mostly drew a bunch of poker chips out of a bag, stacked them
-- up, and used a heads/tails schema to get the values. I don't remember if I
-- kept any die rolls at the start of the string, but most of them are in the
-- middle
binaryString :: String
binaryString = "110001000001111111110101011101011100000011000011111111011000010111001101011011111101001101001101111001011010110110100010000010011001110100110000000101101001110100110101100101100011100101111011001100111100000000010001011100110110000000011001101100001011000010101111100000010101100111111010101110111111101010111011011011100101110100111010011110010110100010100110011111101101010000001000100100011110010010101001111010110011110011010011000011110110011011011101101111111010010110010101101111100110011110011011000011110111101101101111101110010011101000000001101101111011010111111010111100010110000001100000001001011010110111110000010011010001110010001101011010111011111010111111000101110000101111011001100111010100001110100111100001001010101100001011011001100100011111011010101110100111000000111111100001100101011101100000110100001110011010000101010101010100010111110011110100101010110100111001111111001100100001010100111101110011010110110110010101110111101111010110101100011111111111110111010100011111110000011011110111000101000100010010100111010110101111011"

randomizeArray :: Int -> [Int] -> [Int] -> [Int]
randomizeArray _ [] newArray = newArray
randomizeArray binaryStringIndex (element : remainingElements) newArray = do
  if binaryStringIndex >= length binaryString
    then error "Binary string index out of bounds"
    else do
      let binaryValue = binaryString !! binaryStringIndex
      if binaryValue == '0'
        then randomizeArray (binaryStringIndex + 1) remainingElements (element : newArray)
        else
          if binaryValue == '1'
            then randomizeArray (binaryStringIndex + 1) remainingElements (newArray ++ [element])
            else error "Invalid binary value"

randomBoolList1021 :: [Bool]
randomBoolList1021 = map even randomIntList1021

randomBoolList1024 :: [Bool]
randomBoolList1024 = map even randomIntList1024

randomIntList1021 :: [Int]
randomIntList1021 = randomizeArray 0 pseudorandomIntList1021 []

randomIntList1024 :: [Int]
randomIntList1024 = randomizeArray 0 pseudorandomIntList1024 []

-- This list I generated with StdGen and a seed of 143. I could put the
-- function that created it here, but A) the idea of this module is to create
-- randomness that doesn't rely on the system's random number generator, and B)
-- the order of the integers shouldn't technically matter, I just
-- pseudorandomized them for good measure

-- This is the same list as pseudorandomIntList1024 but with the numbers 1022,
-- 1023, and 1024 removed
pseudorandomIntList1021 :: [Int]
pseudorandomIntList1021 = filter (\x -> x /= 1022 && x /= 1023 && x /= 1024) pseudorandomIntList1024

pseudorandomIntList1024 :: [Int]
pseudorandomIntList1024 = [580, 339, 572, 626, 979, 431, 963, 219, 855, 884, 111, 463, 270, 758, 414, 241, 222, 850, 133, 776, 44, 43, 306, 502, 960, 37, 336, 959, 474, 56, 657, 160, 975, 966, 324, 788, 753, 996, 719, 492, 75, 893, 250, 980, 156, 639, 113, 356, 122, 191, 530, 843, 999, 239, 644, 801, 878, 370, 993, 308, 674, 176, 190, 240, 611, 938, 251, 835, 232, 362, 293, 666, 807, 400, 930, 465, 546, 8, 490, 841, 341, 114, 608, 471, 524, 427, 351, 289, 700, 409, 915, 19, 290, 450, 906, 371, 731, 588, 1, 729, 197, 243, 716, 573, 333, 103, 444, 161, 689, 723, 682, 96, 357, 494, 497, 350, 284, 85, 207, 230, 790, 242, 525, 543, 750, 69, 1019, 780, 806, 294, 859, 411, 1009, 641, 343, 715, 484, 542, 870, 924, 747, 523, 602, 950, 943, 818, 383, 705, 978, 875, 423, 1016, 493, 263, 68, 510, 11, 830, 845, 745, 83, 873, 179, 1013, 923, 325, 720, 757, 797, 994, 882, 625, 900, 137, 948, 730, 535, 552, 206, 280, 663, 244, 891, 593, 795, 667, 718, 851, 154, 287, 642, 570, 584, 501, 624, 749, 390, 360, 485, 338, 822, 629, 728, 640, 367, 699, 406, 868, 97, 706, 669, 432, 561, 871, 180, 307, 282, 272, 403, 662, 748, 3, 261, 389, 253, 711, 26, 660, 697, 265, 606, 764, 1002, 32, 804, 784, 653, 738, 377, 164, 537, 346, 782, 25, 860, 529, 534, 318, 897, 614, 45, 654, 853, 613, 435, 690, 874, 934, 201, 766, 453, 39, 121, 701, 29, 743, 594, 675, 374, 181, 388, 630, 106, 939, 819, 28, 1004, 540, 744, 599, 210, 547, 792, 907, 277, 394, 652, 560, 632, 416, 648, 344, 864, 1000, 672, 1011, 70, 321, 425, 521, 189, 172, 638, 6, 13, 681, 763, 862, 566, 789, 955, 204, 756, 735, 754, 138, 825, 79, 680, 564, 193, 359, 844, 783, 997, 184, 514, 4, 987, 635, 298, 258, 941, 117, 676, 770, 751, 846, 105, 528, 21, 413, 314, 833, 173, 794, 264, 148, 309, 734, 61, 515, 902, 722, 317, 587, 713, 254, 726, 595, 679, 793, 313, 274, 741, 187, 717, 977, 834, 319, 628, 673, 233, 848, 266, 67, 447, 972, 863, 1003, 785, 407, 693, 989, 522, 107, 104, 760, 145, 904, 739, 399, 445, 66, 687, 969, 442, 607, 951, 876, 212, 659, 291, 220, 1017, 168, 678, 55, 268, 402, 968, 499, 913, 905, 163, 459, 214, 910, 982, 144, 857, 929, 714, 816, 146, 386, 1001, 457, 194, 631, 721, 90, 986, 305, 742, 72, 147, 940, 881, 736, 527, 316, 131, 847, 155, 811, 671, 9, 869, 577, 275, 118, 417, 382, 478, 1022, 865, 380, 926, 288, 829, 967, 334, 364, 376, 462, 583, 231, 1014, 854, 211, 379, 645, 335, 451, 418, 820, 352, 935, 361, 852, 174, 849, 443, 896, 27, 150, 238, 24, 601, 988, 42, 974, 331, 779, 368, 387, 182, 688, 348, 585, 7, 276, 473, 22, 438, 252, 49, 420, 320, 17, 89, 100, 597, 366, 342, 143, 381, 755, 826, 921, 51, 95, 618, 129, 285, 391, 895, 771, 46, 508, 576, 957, 886, 82, 725, 954, 610, 620, 410, 498, 16, 225, 495, 345, 292, 665, 559, 839, 562, 116, 554, 158, 810, 169, 2, 556, 919, 229, 823, 799, 297, 271, 480, 976, 942, 310, 958, 740, 109, 984, 249, 571, 928, 349, 53, 456, 586, 488, 329, 956, 262, 815, 817, 551, 901, 565, 259, 33, 670, 14, 245, 812, 516, 604, 393, 257, 384, 421, 358, 151, 617, 973, 840, 36, 491, 558, 643, 226, 127, 369, 1010, 59, 536, 167, 31, 134, 933, 198, 88, 945, 961, 550, 746, 202, 708, 496, 596, 470, 836, 981, 139, 223, 234, 995, 208, 452, 838, 800, 880, 332, 256, 322, 424, 612, 765, 401, 430, 41, 132, 985, 38, 694, 199, 428, 183, 777, 619, 918, 278, 448, 837, 216, 506, 637, 821, 888, 877, 916, 224, 867, 203, 312, 57, 76, 119, 246, 605, 52, 512, 419, 520, 582, 727, 396, 661, 301, 615, 63, 927, 269, 237, 861, 123, 330, 911, 920, 598, 991, 185, 281, 128, 732, 136, 831, 326, 209, 73, 227, 487, 698, 519, 87, 922, 140, 84, 378, 962, 879, 221, 408, 1018, 469, 464, 903, 260, 98, 791, 781, 646, 327, 772, 828, 808, 858, 633, 62, 454, 248, 124, 47, 786, 712, 998, 655, 412, 814, 489, 159, 503, 866, 707, 157, 337, 592, 188, 217, 426, 872, 947, 40, 809, 228, 247, 295, 1006, 545, 856, 80, 466, 166, 354, 64, 541, 441, 200, 759, 965, 832, 18, 917, 472, 398, 93, 328, 513, 1015, 120, 236, 439, 709, 769, 126, 110, 775, 446, 953, 636, 218, 548, 34, 590, 569, 135, 702, 623, 434, 355, 141, 677, 909, 538, 668, 695, 77, 175, 684, 622, 5, 710, 526, 422, 186, 990, 774, 567, 273, 437, 152, 575, 578, 887, 23, 162, 568, 213, 621, 691, 931, 475, 372, 773, 802, 505, 112, 415, 1008, 658, 983, 936, 296, 92, 283, 479, 664, 1020, 591, 171, 476, 279, 404, 883, 768, 778, 315, 12, 914, 397, 94, 1023, 539, 805, 436, 340, 449, 50, 286, 303, 971, 1021, 787, 20, 65, 125, 1012, 267, 704, 486, 255, 458, 60, 912, 302, 952, 205, 507, 798, 762, 603, 533, 373, 944, 842, 86, 78, 908, 885, 115, 165, 889, 932, 949, 549, 385, 440, 54, 405, 481, 91, 483, 500, 650, 455, 235, 177, 300, 347, 937, 649, 130, 323, 964, 925, 102, 429, 544, 10, 74, 531, 555, 99, 656, 553, 518, 142, 192, 890, 767, 589, 511, 532, 683, 392, 1005, 304, 30, 894, 627, 899, 375, 609, 311, 299, 170, 581, 686, 796, 892, 634, 557, 195, 477, 81, 616, 898, 215, 563, 108, 395, 970, 35, 752, 574, 1024, 696, 363, 48, 579, 824, 101, 149, 813, 460, 647, 737, 433, 651, 600, 692, 71, 58, 461, 992, 703, 685, 153, 468, 827, 803, 467, 15, 482, 761, 178, 504, 517, 365, 946, 196, 509, 1007, 353, 733, 724]
