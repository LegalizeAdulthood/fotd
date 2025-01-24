<?php

$entries = file('entries.txt', FILE_IGNORE_NEW_LINES);
$num_entries = sizeof($entries);

function get_entry($index)
{
    global $entries;

    $entry = $entries[$index];

    $fields = explode('|', $entry);

    $thumb = $fields[0];
    $image = $fields[1];
    $par = $fields[2];
    $title = preg_replace('/.*\/[0-9.]*-(.*)\.par/', '$1', $par);
    $title = str_replace('_', ' ', $title);
    $date = preg_replace('/.*\/([0-9.]*)-[^\/]*/', '$1', $par);
    return [$index, $date, $title, $par, $image, $thumb];
}

function html_entry($entry)
{
    $index = $entry[0];
    $date = $entry[1];
    $title = $entry[2];
    $par = $entry[3];
    $image = $entry[4];
    $thumb = $entry[5];
    $url = $_SERVER['SCRIPT_NAME'] . '?id=' . $index;

    printf("<!-- %s -->\n" .
        "<a href=\"%s\"><img src=\"%s\"></a><br/>\n" .
        "<a href=\"index.html\">Fractal of the Day</a>, %s\n<br/>" .
        "%s (<a href=\"%s\">parameter file</a>)\n", 
        $url,
        $image, $thumb,
        $date,
        $title, $par);
}

function json_entry($entry)
{
    header('Content-Type: application/json');
    $base = 'https://user.xmission.com/~legalize/fractals/fotd/';
    $entry[2] = $base . '/' . $entry[2];
    $entry[3] = $base . '/' . $entry[3];
    $entry[4] = $base . '/' . $entry[4];
    print(json_encode($entry));
}

function markdown_entry($entry)
{
    header('Content-Type: text/markdown');
    $base = 'https://user.xmission.com/~legalize/fractals/fotd/';
    $fotd = $base . 'index.html';
    $entry[2] = $base . '/' . $entry[2];
    $entry[3] = $base . '/' . $entry[3];
    $entry[4] = $base . '/' . $entry[4];

    $index = $entry[0];
    $date = $entry[1];
    $title = $entry[2];
    $par = $entry[3];
    $image = $entry[4];
    $thumb = $entry[5];
    $url = $_SERVER['SCRIPT_NAME'] . '?id=' . $index;

    printf("<!-- %s -->\n" .
        "[![FOTD %s](%s)](%s)]<br/>\n" .
        "[Fractal of the Day](%s), %s<br/>\n" .
        "%s ([parameter file](%s))<br/>\n",
        $url,
        $date, $thumb, $image,
        $fotd, $date,
        $title, $par);
}

function main($info, $get)
{
    global $num_entries;

    if (array_key_exists('id', $get)) {
        $index = $get['id'];
        if ($index < 0 || $index >= $num_entries) {
            $index = rand(0, $num_entries);
        }
    } else {
        $index = rand(0, $num_entries);
    }
    $entry = get_entry($index);
    if ($info == '/json') {
        json_entry($entry);
    } else if ($info == '/md') {
        markdown_entry($entry);
    } else {
        html_entry($entry);
    }
}

main($_SERVER['PATH_INFO'], $_GET);
