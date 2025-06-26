<?php

$entries = file('entries.txt', FILE_IGNORE_NEW_LINES);
$num_entries = sizeof($entries);
$site = 'https://user.xmission.com';
$base = $site . '/~legalize/fractals/fotd/';
$fotd = $base . 'index.html';

function get_entry($index)
{
    global $entries, $base, $site;

    $entry = trim($entries[$index]);

    $fields = explode('|', $entry);

    $thumb = $base . $fields[0];
    $image = $base . $fields[1];
    $par = $base . $fields[2];
    $title = preg_replace('/.*\/[0-9.]*-(.*)\.par/', '$1', $par);
    $title = str_replace('_', ' ', $title);
    $date = preg_replace('/.*\/([0-9.]*)-[^\/]*/', '$1', $par);
    $url = $site . $_SERVER['SCRIPT_NAME'] . '?id=' . $index;
    return [$index, $date, $title, $par, $image, $thumb, $url];
}

function html_entry($entry)
{
    global $fotd, $site;

    $index = $entry[0];
    $date = $entry[1];
    $title = $entry[2];
    $par = $entry[3];
    $image = $entry[4];
    $thumb = $entry[5];
    $url = $entry[6];

    printf("<!-- %s -->\n" .
        "<a href=\"%s\"><img src=\"%s\"></a><br/>\n" .
        "<a href=\"%s\">Fractal of the Day</a>, %s<br/>\n" .
        "%s (<a href=\"%s\">parameter file</a>)\n", 
        $url,
        $image, $thumb,
        $fotd, $date,
        $title, $par);
}

function json_entry($entry)
{
    header('Content-Type: application/json');
    print(json_encode($entry));
}

function markdown_entry($entry)
{
    global $fotd;

    header('Content-Type: text/markdown');

    $index = $entry[0];
    $date = $entry[1];
    $title = $entry[2];
    $par = $entry[3];
    $image = $entry[4];
    $thumb = $entry[5];
    $url = $entry[6];

    printf("<!-- %s -->\n" .
        "[![FOTD %s](%s)](%s)<br/>\n" .
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
