<?php
$params = unserialize($inMod['params']);
?>

<?php
if ($inMod['showtitle']) {
    echo '<h4>' . $inMod['title'] . '</h4>';
}

print $inMod['body'] . $inMod['jscode'];
?>
