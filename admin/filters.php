<?php
if (!Core::$action) {
    $core->action = 'view';
} else {
    $core->action = Core::$action;
}

if (!Core::$id) {
    $core->id = 0;
} else {
    $core->id = Core::$id;
}

$menu = Registry::get("content");
$lang = Registry::get("Lang");
$config = Registry::get("Config");
$db = Registry::get("DataBase");
$content = Registry::get("Content");
$user = Registry::get("Users");
$pager = Registry::get("Paginator");

?>

    <div class="page-header">
        <div class="page-title">
            <h3>Фильтры
                <small>управления</small>
            </h3>
        </div>

    </div>
    <div class="clearfix"></div>
<?php
if ($core->action == 'view') {
    if (!empty(Core::$post['filter'])) {
        $where = "where title like '%" . Core::$post['filter'] . "%'";
    }
    $posrow =$db->fetch_all("select * from filters {$where}");
    ?>
    <form method="post">
    <div class="page-header">
    </div>
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="col-md-12">
                <div class="table-responsive">
                    <div class="datatable-header">
                        <div class="dataTables_filter"><label><span>Фильтр:</span> <input name="filter"
                                                                                          type="search" class=""
                                                                                          aria-controls="DataTables_Table_0"
                                                                                          placeholder="Фильтр..."></label>
                            <input type="submit" class="btn btn-primary" value="Фильтр">
                        </div>
                    <div class="dataTables_length"><label><span>Просмотр:</span>
                                <?php echo $pager->items_per_page(); ?></label></div>
                    </div>
                    <table class="table table-bordered table-check">
                        <thead>
                        <tr>
                            <th><a href="javascript:" onclick="javascript:invert()">#</a></th>

                            <th>ID</th>
                            <th width="400">Название</th>
                            <th>Описание</th>
                            <th>Включен</th>

                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        $count = 0;
                        foreach ($posrow as $filters) {
                            $count++;
                            ?>
                            <tr>
                                <th scope="row"><input type="checkbox" name='item[]' id='item[]' class="styled"
                                                       value="<?php echo $filters->id; ?>"/></th>
                                <!--                        <th scope="row">--><?php //echo $count; ?><!--</th>-->
                                <td>
                                    <a href="index.php?do=filters"><?php echo $filters->id; ?></a>
                                </td>
                                <td>
                                    <a href="index.php?do=filters"><?php echo $filters->title; ?></a>
                                </td>
                                <td>
                                    <a href="index.php?do=filters"><?php echo $filters->desription; ?></a>
                                </td>


                                <td>
                                    <a href="index.php?do=filters&action=active&id=<?php echo $filters->id; ?>">
                                        <div class="state iradio_line-blue checked">
                                            <div
                                                class="icheck_line-icon"><?php echo $filters->published ? "<i class='icon-checkmark-circle2'></i>" : "<i class='icon-cancel-circle2'></i>"; ?></div>
                                        </div>
                                    </a>
                                </td>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                    <div class="clearfix"></div>
                </div>

                <div class="table-footer">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="dataTables_paginate paging_bootstrap" id="example2_paginate">
                                <?php if ($pager->display_pages()) { ?>
                                    <?php echo $pager->display_pages(); ?>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
    </div>
    </form>
    <?php
}

if ($core->action=='active'){
    $row=$db->getValuesById("*","filters",Core::$id);
    if ($row->published==1){
        $data=array("published"=>'0');
        $db->update('filters',$data,'id='.$row->id);
    }else{
        $data=array("published"=>'1');
        $db->update('filters',$data,'id='.$row->id);
    }
    header("Location:index.php?do=filters");
}
?>