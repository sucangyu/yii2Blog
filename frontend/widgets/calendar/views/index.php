<?php
use yii\helpers\Url;
use yii\helpers\Html;
?>
<?=Html::cssFile('@web/statics/css/easyui.css')?>
<?=Html::jsFile('@web/statics/js/jquery-1.8.3.min.js')?>
<div class="panel">
<!-- 只言片语 -->
<div class="panel-title box-title">
    <span><strong>日历</strong></span>
<!--    <span class="pull-right"><a href="#" class="font-12">更多》</a></span>-->
</div>

<div class="panel-body">
        <div class="home">
            <h4><?=date('Y年m月d日',$date['time'])?></h4>
            <table  cellspacing="1" cellpadding="1" >
                <thead id="thead">
                <tr class="tr1">
                    <td>日</td>
                    <td>一</td>
                    <td>二</td>
                    <td>三</td>
                    <td>四</td>
                    <td>五</td>
                    <td>六</td>
                </tr>
                </thead>
                <tbody id="tbody"></tbody>
            </table>
            <button id="button" class="btn btn-success btn-block">签到</button>
            <button id="button2" class="btn btn-info btn-block">本月已签</button>
        </div>



        <script type="text/javascript">
            $(function(){
                var sliarrn=<?=$data?>;
                var $thead=$('#thead'),
                    $tbody=$('#tbody'),
                    $button=$('#button'),
                    $button2=$('#button2'),
                    //wk=true,

                //slidate=new Date(),
                    _nullnei='',
                    //de=slidate.getDate();//当日
                    de=<?=$date['d']?>;//当日
                var wk = $.inArray(de, sliarrn);

                //var monthFirst = new Date(slidate.getFullYear(), parseInt(slidate.getMonth()), 1).getDay();//获取当月的1日等于星期几
                //var d = new Date(slidate.getFullYear(), parseInt(slidate.getMonth() + 1), 0); //获取月
                //var conter=d.getDate();//获取当前月的天数
                var monthFirst = <?=$date['w']?>;//获取当月的1日等于星期几
                var conter=<?=$date['ds']?>;//获取当前月的天数
                var wqd = 0;//获取当月未签到天数
                //console.log(de);
                //alert(sliarrn);
                //遍历日历网格
                for(var i=1; i<=6;i++){
                    _nullnei+="<tr>";
                    for(var j=1; j<=7;j++)
                    {
                        _nullnei+='<td></td>';
                    }
                    _nullnei+="</tr>";
                }
                $tbody.html(_nullnei);

                //遍历网格内容
                var $slitd=$tbody.find("td");
                for(var i=0; i<conter; i++)
                {
                    $slitd.eq(i+monthFirst).html("<p>"+parseInt(i+1)+"</p>")
                }

                Funback();//给当前日加样式
                Funmore();//本月未签到样式
                Funmonth();//查询已签到
                $button.on("click",function(){
                    //console.log(sliarrn);
                    if(wk==-1)
                    {
                        $.ajax({
                            type: 'POST',
                            url: '<?php echo Yii::$app->request->baseUrl. '/index.php/site/tsign' ?>',
                            data:{"de":de},
                            success: function(data){
                                //console.log(data);
                                if (data){
                                    sliarrn.push(de);//把当日传入已签
                                    Funmonth();	//再次查询签到
                                    alert('已签到');
                                    $button.html('已签到');
                                    $button.attr('disabled',true);//falst是禁用
                                    //console.log(sliarrn);
                                }
                                if (!data){
                                    alert(data['msg']);
                                }

                            },
                        });

                    }else {
                        alert('您本日已签到,请勿重复签到');
                    }

                })


                $button2.on("click",function(){
                    alert('你本月已签到'+  sliarrn.length  +'次')
                })
                function Funback(){
                    $slitd.eq(parseInt(de)).addClass('color')
                }

                function Funmore(){
                    for(var i=0; i<wqd; i++)
                    {
                        $slitd.eq(i).addClass('weiqian')
                    }
                }
                function Funmonth(){
                    for(var i=0; i<conter; i++)
                    {
                        for(var j=0; j<sliarrn.length;j++)
                        {
                            if(i==sliarrn[j])
                            {
                                $slitd.eq(i).addClass('los')
                            }
                        }
                    }
                }
            })
        </script>



</div>
</div>