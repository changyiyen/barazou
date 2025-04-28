BEGIN {
    capillary_regex="([L|R][0-9]{1,2}).+?Capillary[ ]+?Objects[ ]+?([0-9]{1,2})";
    giant_regex="([L|R][0-9]{1,2}).+?Giant Capillary[ ]+?Objects[ ]+([0-9]{1,2})";
    enlarged_regex="([L|R][0-9]{1,2}).+?Enlarged Loop[ ]+?Objects[ ]+([0-9]{1,2})";
    hemorrhage_regex="([L|R][0-9]{1,2}).+?Hemorrhage[ ]+?Objects[ ]+([0-9]{1,2})";
    
    # Workaround since pdftotext has trouble identifying the whole word
    #ramification_regex="([L|R][0-9]{1,2}).+?Ramification[ ]+?Objects[ ]+([0-9]{1,2})";
    ramification_regex="([L|R][0-9]{1,2}).+?Rami.+?[ ]+?Objects[ ]+([0-9]{1,2})";
    #disorganization_regex="([L|R][0-9]{1,2}).+?Disorganization[ ]+?Objects[ ]+([0-9]{1,2})";
    disorganization_regex="([L|R][0-9]{1,2}).+?Diso.+?[ ]+?Objects[ ]+([0-9]{1,2})";

    total_capillary_count = 0;
    images_with_capillaries = 0;

    split("R2-R3-R4-R5", right, "-");
    split("L2-L3-L4-L5", left, "-");

    # No autovivification in Awk :(
    delete digit_image_count[0];
    delete enlarged[0];
    delete hemorrhage[0];

    giants = "no";
}

# Skips first lines (summary table in the PDF)
NR < 20 {next;}
NR == 20 { RS="Comment";}

match($0, capillary_regex, arr) {
    #print arr[1] " Capillaries " arr[2];
    images_with_capillaries++;
    digit_image_count[arr[1]]++;
    capillary_count[arr[1]] += arr[2];
    total_capillary_count += arr[2];
}
match($0, giant_regex, arr) {
    #print arr[1] " Giant " arr[2];
    giant_count[arr[1]] += arr[2];
}
match($0, enlarged_regex, arr) {
    #print arr[1] " Enlarged " arr[2];
    enlarged[length(enlarged) + 1] = arr[1];
    enlarged_count[arr[1]] += arr[2];
}
match($0, hemorrhage_regex, arr) {
    #print arr[1] " Hemorrhage " arr[2];
    hemorrhage[length(hemorrhage) + 1] = arr[1];
    hemorrhage_count[arr[1]] += arr[2];
}
match($0, ramification_regex, arr) {
    #print arr[1] " Ramification " arr[2];
    ramification_count[arr[1]] += arr[2];
}
match($0, disorganization_regex, arr) {
    #print arr[1] " Disorganization " arr[2];
    disorganization_count[arr[1]] += arr[2];
}

END {
    print FILENAME;
    print "Right hand:";
    for (i=1; i <= length(right); i++) {
        printf "  %s: %.1f capillaries", right[i], capillary_count[right[i]]/digit_image_count[right[i]];
        if (giant_count[right[i]] > 0) {
            printf ", %.1f giant capillaries", giant_count[right[i]]/digit_image_count[right[i]];
            giants = "yes";
        }
        if (enlarged_count[right[i]] > 0) {
            printf ", %.1f enlarged loops", enlarged_count[right[i]]/digit_image_count[right[i]];
        }
        if (hemorrhage_count[right[i]] > 0) {
            printf ", %.1f hemorrhages", hemorrhage_count[right[i]]/digit_image_count[right[i]];
        }
        if (ramification_count[right[i]] > 0) {
            printf ", %.1f ramifications", ramification_count[right[i]]/digit_image_count[right[i]];
        }
        if (disorganization_count[right[i]] > 0) {
            printf ", %.1f disorganized loops", disorganization_count[right[i]]/digit_image_count[right[i]];
        }
        printf "\n";
    }

    print "Left hand:";
    for (i=1; i <= length(left); i++) {
        printf "  %s: %.1f capillaries", left[i], capillary_count[left[i]]/digit_image_count[left[i]];
        if (giant_count[left[i]] > 0) {
            printf ", %.1f giant capillaries", giant_count[left[i]]/digit_image_count[left[i]];
            giants = "yes";
        }
        if (enlarged_count[left[i]] > 0) {
            printf ", %.1f enlarged loops", enlarged_count[left[i]]/digit_image_count[left[i]];
        }
        if (hemorrhage_count[left[i]] > 0) {
            printf ", %.1f hemorrhages", hemorrhage_count[left[i]]/digit_image_count[left[i]];
        }
        if (ramification_count[left[i]] > 0) {
            printf ", %.1f ramifications", ramification_count[left[i]]/digit_image_count[left[i]];
        }
        if (disorganization_count[left[i]] > 0) {
            printf ", %.1f disorganized loops", disorganization_count[left[i]]/digit_image_count[left[i]];
        }
        printf "\n";
    }

    print "Other findings:";

    printf "  Capillary density: average " total_capillary_count/images_with_capillaries " capillaries/mm,";
    if (total_capillary_count/images_with_capillaries >= 7) {printf " not ";}
    print "decreased";

    printf "  Capillary diameter > 50uM（giant capillary）: %s\n", giants;
    printf "  Hemorrhage: "
    if (length(hemorrhage) > 0) {
        printf "yes, in ";
        for (i=1; i <= length(hemorrhage); i++) {
            printf "%s, ", hemorrhage[i];
        }
    }
    else {
        printf "no";
    }
    printf "\n";
    print "Impression:";
    print "  [ Non-scleroderma | Scleroderma ] pattern";
    print "Non-specific abnormalities:";
    if (length(hemorrhage) > 0) {
        print "  - hemorrhage";
    }
    print "  [ - focal avascular area ]";
    if (length(enlarged) > 0) {
        printf "  - ectasic capillaries（<50uM）in ";
    }
    for (i=1; i <= length(enlarged); i++) {
        printf "%s, ", enlarged[i];
    }
    printf "\n";
}