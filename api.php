<?php

function dir_and_day($path)
{
    $pieces = explode('/', $path);
    return array(
        implode('/', array_slice($pieces, 0, -1)),
        $pieces[count($pieces)-1]
    );
}

function fractals($url, $dir)
{
    $result = array();
    list($dir, $day) = dir_and_day($dir);
    $fractals = dir($dir);
    while (false !== ($fractal = $fractals->read())) {
        if (preg_match('/\.par$/', $fractal)) {
            $base = substr($fractal, 0, strlen($fractal)-4);
            $name = preg_replace('/^[^-]+-(.*)/', '$1', $base);
            $name = preg_replace('/_/', ' ', $name);
            $parameters = $base . '.par';
            $thumbnail = $base . '.thumb.jpg';
            $image = $base . '.jpg';
            preg_match('/^[0-9.]+\.([0-9][0-9])-.*/', $base, $file_day);
            if ($day == $file_day[1]) {
                $cmd = './elapsedTime.pl ' . $dir .  '/' . $parameters;
                $elapsed = array();
                exec($cmd, $elapsed);
                    $prefix = substr($url, 0, strlen($url) - strlen('/api.php'))
                    . '/' . $dir . '/';
                array_push($result,
                    array(
                        'name' => $name,
                        'parameters' => $prefix . $parameters,
                        'thumbnail' => $prefix . $thumbnail,
                        'image' => $prefix . $image,
                        'filesize' => filesize($dir . '/' . $image),
                        'rendering_time' => $elapsed[0]
                    )
                );
            }
        }
    }
    return $result;
}

function days($url, $dir)
{
    $result = array();
    $fractals = dir($dir);
    while (false !== ($fractal = $fractals->read())) {
        if (preg_match('/\.par$/', $fractal)) {
            $base = substr($fractal, 0, strlen($fractal)-4);
            $name = preg_replace('/^[^-]+-(.*)/', '$1', $base);
            $name = preg_replace('/_/', ' ', $name);
            $parameters = $base . '.par';
            $thumbnail = $base . '.thumb.jpg';
            $image = $base . '.jpg';
            preg_match('/^[0-9]+\.[0-9][0-9]\.([0-9][0-9])-.*/', $base, $day);
            $day = $day[1];
            $result[$day] = $url . '/day/' . $dir . '/' . $day;
        }
    }
    return $result;
}

function months($url, $dir)
{
    $result = array();
    $months = dir($dir);
    while (false !== ($month = $months->read())) {
        if (preg_match('/[0-9]+/', $month)) {
            $result[$month] = $url . '/month/' . $dir . '/' . $month;
        }
    }
    return $result;
}

function years($url)
{
    $result = array();
    $years = dir('.');
    while (false !== ($year = $years->read())) {
        if (preg_match('/[0-9]+/', $year)) {
            $result[$year] = $url . '/year/' . $year;
        }
    }

    return $result;
}

function get_resource($url, $resource, $id)
{
    if ($resource == 'year') {
        return months($url, $id);
    } else if ($resource == 'month') {
        return days($url, $id);
    } else if ($resource == 'day') {
        return fractals($url, $id);
    } else {
        return array("unknown resource $resource/$id");
    }
}

function main($info, $url)
{
    if (strlen($info) == 0) {
        return years($url);
    } else {
        $matches = array();
        if (preg_match('%([^/]+)/(.*)%', $info, $matches)) {
            $resource = $matches[1];
            $id = $matches[2];
            return get_resource($url, $resource, $id);
        } else {
            return "?Unknown request ($info, $url)";
        }
    }
}

header('Content-Type: application/json');
print(json_encode(
    main($_SERVER['PATH_INFO'], $_SERVER['SCRIPT_NAME'])
));
