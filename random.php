<?php

$entries = file('entries.txt', FILE_IGNORE_NEW_LINES);

$num_entries = sizeof($entries);

function entry($i)
{
    $entry = $entries[$i];

    $fields = explode('|', $entry);

    $thumb = $fields[0];
    $image = $fields[1];
    $par = $fields[2];
    $title = preg_replace('/.*\/[0-9.]*-(.*)\.par/', '$1', $par);
    $title = str_replace('_', ' ', $title);
    $date = preg_replace('/.*\/([0-9.]*)-[^\/]*/', '$1', $par);

    printf("<a href=\"%s\"><img src=\"%s\"></a><br/>\n" .
        "<a href=\"index.html\">Fractal of the Day</a>, %s\n<br/>" .
        "%s (<a href=\"%s\">parameter file</a>)\n", 
        $image, $thumb, $date, $title, $par);
}

entry(rand(0, $num_entries));
