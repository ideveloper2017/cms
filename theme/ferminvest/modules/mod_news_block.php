<?php
    $count = 0;
    foreach ($articles as $content) {
        $count++;
        if ($count == 1) {
            ?>
<div class="cs-col cs-col-6-of-12">

    <div class="cs-post-block-layout-3">
        <div class="cs-post-item">

            <div class="cs-post-thumb">
<!--                <div class="cs-post-category-solid cs-clearfix">-->
<!--                    <a href="/content/--><?php //echo $content['href']; ?><!--">Photography</a>-->
<!--                </div>-->
<!--                <div class="cs-post-format-icon">-->
<!--                    <i class="fa fa-play"></i>-->
<!--                </div>-->

                <a href="/content/<?php echo $content['href']; ?>"><img src="<?php echo $content['first_image']?$content['first_image']:$content['image'] ?>"></a>
                </div>
            <div class="cs-post-inner">
                <h3><a href="/content/<?php echo $content['href']; ?>"><?php echo $content['title'] ?></a></h3>
                <div class="cs-post-meta cs-clearfix">
<!--                    <span class="cs-post-meta-author"><a href="post_standard.html">D. Smith</a></span>-->
                    <div class="cs-post-meta cs-clearfix">
                        <!--                            <span class="cs-post-meta-author"><a href="post_standard.html">H. Smith</a></span>-->
                        <span class="cs-post-meta-date"><i class="fa fa-calendar"></i> <?php echo $content['date'];?> &nbsp;&nbsp; <i class="fa fa-eye"></i> <?php echo $content['hits'];?></span>
                    </div>
<!--                                            <span class="cs-post-meta-rating" title="Rated 3.50 out of 5">-->
<!--                                                <span style="width: 70%">3.50 out of 5</span>-->
<!--                                            </span>-->
                </div>
            </div>
<!---->
<!--                <div class="article-right">-->
<!--                    <div class="article-title">-->
<!--                        <p><span-->
<!--                                class="glyphicon glyphicon-calendar"> --><?php //echo $content['date'];?><!-- <a class="span_link"-->
<!--                                                                                        href="#"><span-->
<!--                                    class="glyphicon glyphicon-eye-open"></span>--><?php //echo $content['hits'];?><!-- </a></p>-->
<!--                        <a class="title" href="/content/--><?php //echo $content['href']; ?><!--"> --><?php //echo $content['title'] ?><!--</a>-->
<!--                    </div>-->
<!--                    <div class="article-text">-->
<!--                        --><?php //echo $content['description'];?>
<!--                        <a href="/content/--><?php //echo $content['href']; ?><!--"><img src="--><?php //echo THEMEURL;?><!--/images/more.png" alt=""/></a>-->
<!--                        <div class="clearfix"></div>-->
<!--                    </div>-->
<!--                </div>-->
<!--                <div class="clearfix"></div>-->
            </div>
    </div>
    </div>
<div class="cs-col cs-col-6-of-12">
    <div class="cs-post-block-layout-2">
            <?php } else {?>

                <div class="cs-post-item">
                    <div class="cs-post-thumb">
                        <a href="post_standard.html"><img src="<?php echo $content['first_image']?$content['first_image']:$content['image'] ?>" alt="UniqMag" style="width:100px;height:75px ;"></a>
                    </div>
                    <div class="cs-post-inner">
                        <h3><a href="post_standard.html"><?php echo $content['title'] ?></a></h3>
<!--                        <div class="cs-post-category-empty cs-clearfix">-->
<!--                            <a href="blog_layout_1.html">Science</a>-->
<!--                        </div>-->
                        <div class="cs-post-meta cs-clearfix">
<!--                            <span class="cs-post-meta-author"><a href="post_standard.html">H. Smith</a></span>-->
                            <span class="cs-post-meta-date"><i class="fa fa-calendar"></i> <?php echo $content['date'];?> &nbsp;&nbsp; <i class="fa fa-eye"></i> <?php echo $content['hits'];?></span>
                        </div>
                    </div>
                </div>
            <?php }?>




<!--            <div class="article-big-block">-->
<!--                <div class="article-photo">-->
<!--				<span class="image-hover">-->
<!--				<span class="drop-icons">-->
<!--				<span class="icon-block"><a href="/images/content/--><?php //echo $content['image'] ?><!--" title="Show Image"-->
<!--                                                                                    class="icon-loupe legatus-tooltip">-->
<!--                                                                &nbsp;</a></span>-->
<!--														<span class="icon-block"><a href="/content/--><?php //echo $content['href']; ?><!--"-->
<!--                                                                                    title="Read Article"-->
<!--                                                                                    class="icon-link legatus-tooltip">-->
<!--                                                                &nbsp;</a></span>-->
<!--													</span>-->
<!--													<img src="/images/content/--><?php //echo $content['image'] ?><!--" class="setborder" alt=""/>-->
<!--												</span>-->
<!--                </div>-->
<!---->
<!--                <div class="article-header">-->
<!--                    <h4><a href="/content/--><?php //echo $content['href']; ?><!--">--><?php //echo $content['title'] ?><!--</a></h4>-->
<!--                </div>-->
<!---->
<!--                <div class="article-content">-->
<!--                    --><?php //echo $content['description'];?>
<!--                               </div>-->
<!---->
<!--                <div class="article-links">-->
<!--                    <a href="/content/--><?php //echo $content['href']; ?><!--#comments" class="article-icon-link">-->
<!--                        <span class="meta-date"></span>--><?php //echo $content['date'];?><!--</a>-->
<!--                    <a href="#" class="article-icon-link">-->
<!--                        <span class="view-meta"></span>--><?php //echo $content['hits'];?><!--</a>-->
<!--                    <a href="/content/--><?php //echo $content['href']; ?><!--" class="article-icon-link"><span-->
<!--                            class="icon-text">&#59212;</span>Батафсил</a>-->
<!--                </div>-->
<!--                <!-- END .article-big-block -->
<!--            </div>-->
            <?php
            ?>


<!--        --><?php
//        }?>

    <?php } ?>
</div>
</div>

