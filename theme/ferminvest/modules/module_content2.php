<?php
$params = unserialize($inMod['params']);
?>
    <div class="trending-box4">

<?php
if ($inMod['showtitle']) {
    echo ' <div class="trending-box-title">
            <strong>&nbsp;</strong> <span>' . $inMod['title'] . '</span>
        </div>'  ;
}

print $inMod['body'] . $inMod['jscode'];
print "</div>";
print '<div style="clear:both">&nbsp;</div>'

?>